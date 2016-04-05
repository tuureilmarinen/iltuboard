require 'rails_helper'

RSpec.describe User, type: :model do
	let(:hash){{
	"provider"=>"google", "uid"=>"133760969696", "info"=>{
		"name"=>"Pelle Hermanni", "first_name"=>"Pelle", "last_name"=>"Hermanni", "image"=>"http://totally.legit/picture.jpg", 			"urls"=>{
			"Google"=>"https://plus.google.com/1337"
		}
	}, "credentials"=>{
		"token"=>"totallylegittoken", "expires_at"=>1459841111, "expires"=>true
	}, "extra"=>{
		"id_token"=>"legit_id_token", "raw_info"=>{
			"kind"=>"plus#personOpenIdConnect", "gender"=>"male", "sub"=>"1337", "name"=>"Pelle Hermanni", "given_name"=>"Pelle", "family_name"=>"Hermanni", "profile"=>"https://plus.google.com/1337", "picture"=>"http://totally.legit/picture.jpg", "locale"=>"en-GB"
		}
	}
	}}
	let(:hash2){{
	"provider"=>"google", "uid"=>"123123123", "info"=>{
		"name"=>"antti ahkera", "first_name"=>"antti", "last_name"=>"ahkera", "image"=>"http://totally.legit/picture2.jpg", 			"urls"=>{
			"Google"=>"https://plus.google.com/13371"
		}
	}, "credentials"=>{
		"token"=>"totallylegittoken", "expires_at"=>1459841111, "expires"=>true
	}, "extra"=>{
		"id_token"=>"legit_id_token", "raw_info"=>{
			"kind"=>"plus#personOpenIdConnect", "gender"=>"male", "sub"=>"13371", "name"=>"antti ahkera", "given_name"=>"antti", "family_name"=>"ahkera", "profile"=>"https://plus.google.com/13371", "picture"=>"http://totally.legit/picture2.jpg", "locale"=>"en-GB"
		}
	}
	}}
	let(:hash3){{ #same Uid etc. as :hash
	"provider"=>"google", "uid"=>"133760969696", "info"=>{
		"name"=>"Anu Ananas", "first_name"=>"Anu", "last_name"=>"Ananas", "image"=>"http://totally.legit/picture.jpg", 			"urls"=>{
			"Google"=>"https://plus.google.com/1337"
		}
	}, "credentials"=>{
		"token"=>"totallylegittoken", "expires_at"=>1459841111, "expires"=>true
	}, "extra"=>{
		"id_token"=>"legit_id_token", "raw_info"=>{
			"kind"=>"plus#personOpenIdConnect", "gender"=>"female", "sub"=>"1337", "name"=>"Anu Ananas", "given_name"=>"Anu", "family_name"=>"Ananas", "profile"=>"https://plus.google.com/1337", "picture"=>"http://totally.legit/picture.jpg", "locale"=>"en-GB"
		}
	}
	}}
	let(:u){User.from_omniauth(hash)}
	context "first new user with provider, uid, and name" do
		it "is created" do
			expect(u).not_to be(false)
		end
		it "is valid" do
			expect(u).to be_valid
		end
		it "is saved" do
			u.save
			expect(User.count).to be(1)
		end
		it "is set as admin" do
			expect(u.admin?).to be(true)
		end
		it "to_s returns info in correct format" do
			expect(u.to_s).to eq("Pelle Hermanni (1)")
		end

	end
	context "exsisting user with provider, uid, and name" do
		let(:u1){User.from_omniauth(hash)}
		it "does not create multiple instances of user to database" do
			u.save
			u1.save
			expect(User.count).to be(1)
		end
	end
	context "exsisting user with changed name" do
		let(:u3){User.from_omniauth(hash3)}
		it "does not create new user into database" do
			u.save
			u3.save
			expect(User.count).to be(1)
		end
		it "updates old name" do 
			u.save
			u3.save
			expect(User.find(u3.id).name).to eq("Anu Ananas")
		end

	end
end
