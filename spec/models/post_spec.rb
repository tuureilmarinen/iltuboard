require 'rails_helper'

RSpec.describe Post, type: :model do
	context "posted" do
		it "returns correct url" do
			b=Board.create url:"wololoo",name:"ayoho",description:"blue to red",visible:true,nsfw:true
			t = b.topics.create name:"alluhu"
			p = t.posts.create content:"postbullshit",user:User.first,show_name:3
			#/wololoo/1#1
			expect(p.url).to eq "/"+b.url+"/"+t.id.to_s+"#"+p.id.to_s
		end
	end
end
