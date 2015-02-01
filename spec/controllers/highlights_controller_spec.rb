require 'rails_helper'

describe HighlightsController, type: :controller do
  describe "GET INDEX" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the highlights into @highlights" do
      highlight1 = create :highlight
      highlight2 = create :highlight
      get :index
      expect(assigns(:highlights)).to match_array([highlight1, highlight2])
    end

    it "Paginates Highlights with 5 per page" do
      array = []
      6.times do
        h = create :highlight
        array << h
      end
      get :index

      expect(assigns(:highlights)).not_to match_array(array)
      expect(assigns(:highlights).length).to eq(5)
    end
  end


end
