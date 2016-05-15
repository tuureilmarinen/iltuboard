require 'rails_helper'

RSpec.describe Board, type: :model do
  context "with 2 topics" do
  		let(:u){User.create provider:"google", uid:"havukalle",name:"Hermanni",url:"ayoho"}
		let(:b){Board.create url:"wololoo",name:"ayoho",description:"blue to red",visible:true,nsfw:true}
		let(:t){b.topics.create name:"ykkonen"}
		let(:p){t.posts.create content:"postbullshit",user:u,show_name:3}
		let(:t2){b.topics.create name:"kakkonen"}
		let(:p2){t.posts.create content:"postbullshit2",user:u,show_name:3}

		it "returns the topic with latest post first" do
			u.save
			b.save
			t.save
			p.save
			t2.save
			p2.save
			expect(b.find_topics_sorted).to eq([t,t2])
		end
  end
end
