describe "SerpApi Desktop JSON" do

  describe "Shopping Results for Hubbardton Forge 204529" do

    before :all do
      @response = HTTP.get 'https://serpapi.com/search.json?q=Hubbardton+Forge+204529&tbm=shop&location=Dallas&hl=en&gl=us&source=test'
      @json = @response.parse
    end

    it "returns http success" do
      expect(@response.code).to be(200)
    end

    it "contains Shopping Results array" do
      expect(@json["shopping_results"]).to be_an(Array)
    end

    it "Shopping Results array has more than 10 results" do
      expect(@json["shopping_results"].size).to be > 10
    end

    describe "has a first shopping results" do

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
      
      it "has a snippet" do
        expect(@first_result["snippet"]).to_not be_empty
      end

    end

  end

end