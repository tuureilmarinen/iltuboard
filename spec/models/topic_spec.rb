require 'rails_helper'

RSpec.describe Topic, type: :model do
	let(:u){User.create provider:"google", uid:"havukalle",name:"Hermanni",url:"ayoho"}
	let(:b){Board.create url:"wololoo",name:"ayoho",description:"blue to red",visible:true,nsfw:true}
	let(:t){b.topics.create name:"alluhu"}
	let(:p){t.posts.create content:"postbullshit",user:u,show_name:0}
	let(:p1){t.posts.create content:"postbullshit1",user:u,show_name:1}
	let(:p2){t.posts.create content:"postbullshit2",user:u,show_name:2}
	let(:p3){t.posts.create content:"postbullshit3",user:u,show_name:3}
	let(:p4){t.posts.create content:"postbullshit4",user:u,show_name:3}

	context "created" do
		it "returns first and 3 last posts" do
			p.save
			p1.save
			p2.save
			p3.save
			p4.save
			expect(t.get_first_and_last).to eq([p,p2,p3,p4])
		end	
		it "#op is the first post" do
			p.save
			p1.save
			p2.save
			p3.save
			p4.save
			expect(t.op).to eq(p)
		end
		it "#latest_post is set " do
			p.save
			p1.save
			p2.save
			p3.save
			p4.save
			t.latest_post=p4
			expect(t.latest_post).to eq(p4)
		end
		it "#latest_post doest not permit setting non Post as latest post " do
			t.latest_post=p4
			expect(t.latest_post).to eq(p4)
		end
	end
	context "when posts are not saved" do
		it "latest post is nil" do
			expect(t.latest_post).to be(nil)
		end
		it "op is nil" do
			expect(t.op).to be(nil)
		end
	end
end
