shared_examples_for "banner_ids not in the session" do |session_hash|
  before(:each) do
    @banner = Banner.find(101)
    @other_banner = Banner.find(102)
    @campaign_id = 1

    allow(Banner).to receive(:top_banners) { banners_array }
    # prevent shuffling
    allow(banners_array).to receive(:shuffle!)
  end

  let(:banners_array) { [ @banner, @other_banner ] }

  it "should get top banners from Banner model" do
    expect(Banner).to receive(:top_banners){ banners_array }

    get(:show, { campaign_id: @campaign_id }, session_hash)

    expect(assigns(:banner)).to eq(banners_array[0])
  end

  it "should shuffle top banners from Banners model" do
    expect(banners_array).to receive(:shuffle!)

    get(:show, { campaign_id: @campaign_id }, session_hash)
  end

  it "should store top banners in session" do
    get(:show, { campaign_id: @campaign_id }, session_hash)

    expect(session[@campaign_id]).to eq({
      "banner_ids" => banners_array.drop(1).map(&:id)
    })
  end
end
