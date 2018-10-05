describe "SerpApi Desktop JSON" do

  describe "Shopping Results for TV" do

    before :all do
      @response = HTTP.get 'https://serpapi.com/search.json?q=TV&tbm=shop&location=Dallas&hl=en&gl=us&source=test'
      @json = @response.parse
    end

    it "returns http success" do
      expect(@response.code).to be(200)
    end

    it "contains News Results array" do
      expect(@json["shopping_results"]).to be_an(Array)
    end

    it "News Results array has more than 10 results" do
      expect(@json["shopping_results"].size).to be > 10
    end

    describe "has a first news results" do

      before :all do
        @first_result = @json["shopping_results"][0]
      end

      it "has to be first" do
        expect(@first_result["position"]).to be(1)
      end

      it "has a title" do
        expect(@first_result["title"]).to_not be_empty
      end

      it "has a link" do
        expect(@first_result["link"]).to_not be_empty
      end

      it "has a rating" do
        expect(@first_result["rating"]).to be_an(Float)
      end

      it "has a review count" do
        expect(@first_result["review_count"]).to be_an(Integer)
      end

      it "has a snippet" do
        expect(@first_result["snippet"]).to_not be_empty
      end

      it "has extensions" do
        expect(@first_result["extensions"]).to be_an(Array)
      end

      it "has at least one extension with text" do
        expect(@first_result["extensions"][0]).to_not be_empty
      end

    end

  end

end