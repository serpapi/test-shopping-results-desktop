describe "SerpApi Desktop JSON" do

  describe "Shopping Results for Television" do

    before :all do
      @response = HTTP.get 'http://localhost:3000/search.json?q=Television&tbm=shop&location=Dallas&hl=en&gl=us&source=test'
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

      it "has a source" do
        expect(@first_result["source"]).to_not be_empty
      end

      it "has an date" do
        expect(@first_result["date"]).to_not be_empty
      end

      it "has an snippet" do
        expect(@first_result["snippet"]).to_not be_empty
      end

      it "has an thumbnail" do
        expect(@first_result["thumbnail"]).to_not be_empty
      end

    end

  end

end