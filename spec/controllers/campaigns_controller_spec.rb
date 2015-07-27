require 'support/factory_girl'
require 'support/shared_examples'

describe CampaignsController, type: :controller do
  describe "#show" do
    context "when campaign with banners exists in the session" do
      before(:each) do
        @banner = Banner.find(101)
        @other_banner = Banner.find(102)
        @campaign_id = 1
        @session_hash = {
          @campaign_id => { "banner_ids" => [ @banner.id, @other_banner.id ] }
        }
      end

      it "should return first banner" do
        get(:show, { campaign_id: @campaign_id }, @session_hash)

        expect(assigns(:banner)).to eq(@banner)
      end

      it "should not call #set_session_banners" do
        expect(subject).not_to receive(:set_session_banners)

        get(:show, { campaign_id: @campaign_id }, @session_hash)
      end

      it "should store in the session shifted banner_ids array" do
        get(:show, { campaign_id: @campaign_id }, @session_hash)

        expect(session[@campaign_id]).to eq({
          "banner_ids" => [ @other_banner.id ]
        })
      end

      it "should return consecutive banners from banner_ids on consecutive calls" do
        get(:show, { campaign_id: @campaign_id }, @session_hash)

        expect(assigns(:banner)).to eq(@banner)

        get(:show, { campaign_id: @campaign_id }, @session_hash)

        expect(assigns(:banner)).to eq(@other_banner)
      end
    end
    
    context "when campaign without banners exists in the session" do
      it_behaves_like "banner_ids not in the session", @campaign_id => { "banner_ids" => [] }
    end
  
    context "when campaign doesn't exist in the session" do
      it_behaves_like "banner_ids not in the session", nil
    end

    context "when provided campaign_id doesn't exist in the database" do
      it "should return 404" do
        expect {
          get(:show, { campaign_id: 0 })
        }.to raise_error ActiveRecord::RecordNotFound
      end
    end
  end
end
