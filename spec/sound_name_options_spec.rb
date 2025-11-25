# frozen_string_literal: true

require "spec_helper"

RSpec.describe ClariceCochran::SoundNameOptions do
  include ClariceCochran::SoundNameOptions

  describe "#sound_name" do
    context "nil" do
      it "returns nil" do
        expect(sound_name(nil)).to be_nil
      end
    end

    context ":basso" do
      it "returns 'Basso'" do
        expect(sound_name(:basso)).to eq("Basso")
      end
    end
  end
end
