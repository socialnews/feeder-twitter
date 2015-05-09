require 'rails_helper'

RSpec.describe AppInfoController, type: :controller do

  describe "#version" do

    it "returns a hash containing a version number" do

      get "version"

      version_info = JSON.parse(response.body)
      expected_hash = { "version" => "0.0.1" }
      expect(version_info).to eq( expected_hash )

    end

  end

end
