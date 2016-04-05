require 'rails_helper'

RSpec.describe Post, type: :model do
	context "posted" do
		let(:u){User.create provider:"google", uid:"havukalle",name:"Hermanni",url:"ayoho"}
		let(:b){Board.create url:"wololoo",name:"ayoho",description:"blue to red",visible:true,nsfw:true}
		let(:t){b.topics.create name:"alluhu"}
		let(:p){t.posts.create content:"postbullshit",user:u,show_name:3}
		#let(t.latest_post){p}
		it "is valid" do
			expect(p).to be_valid
		end
		it "returns correct url" do
			#/wololoo/1#1
			expect(p.url).to eq "/"+b.url+"/"+t.id.to_s+"#"+p.id.to_s
		end
		it "is saved" do
			p.save
			expect(Post.count).to eq 1
		end
		it "is assigned to user" do
			p.save
			expect(u.posts.first).to eq p
		end
		it "is assigned to topic" do
			t.save
			p.save
			expect(p.topic).to eq t
			expect(t.posts.first).to eq p
		end
		it "contains the information it should" do
			expect(p.content).to eq "postbullshit"
			expect(p.user).to eq u
			expect(p.show_name).to eq "real_name"
		end

	end
	context "with invalid content" do
		let(:u){User.create provider:"google", uid:"havukalle",name:"Hermanni",url:"ayoho"}
		let(:b){Board.create url:"wololoo",name:"ayoho",description:"blue to red",visible:true,nsfw:true}
		let(:t){b.topics.create name:"alluhu"}
		let(:p){t.posts.create user:u,show_name:3}
		
		it "is not valid" do
			expect(p).not_to be_valid
		end
		it "is not saved" do
			p.save
			expect(Post.count).to eq(0)
		end
	end
	context "with "
end
