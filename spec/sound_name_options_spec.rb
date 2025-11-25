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

    context ":blow" do
      it "returns 'Blow'" do
        expect(sound_name(:blow)).to eq("Blow")
      end
    end

    context ":bottle" do
      it "returns 'Bottle'" do
        expect(sound_name(:bottle)).to eq("Bottle")
      end
    end

    context ":frog" do
      it "returns 'Frog'" do
        expect(sound_name(:frog)).to eq("Frog")
      end
    end

    context ":funk" do
      it "returns 'Funk'" do
        expect(sound_name(:funk)).to eq("Funk")
      end
    end

    context ":glass" do
      it "returns 'Glass'" do
        expect(sound_name(:glass)).to eq("Glass")
      end
    end

    context ":hero" do
      it "returns 'Hero'" do
        expect(sound_name(:hero)).to eq("Hero")
      end
    end

    context ":morse" do
      it "returns 'Morse'" do
        expect(sound_name(:morse)).to eq("Morse")
      end
    end

    context ":ping" do
      it "returns 'Ping'" do
        expect(sound_name(:ping)).to eq("Ping")
      end
    end

    context ":pop" do
      it "returns 'Pop'" do
        expect(sound_name(:pop)).to eq("Pop")
      end
    end

    context ":purr" do
      it "returns 'Purr'" do
        expect(sound_name(:purr)).to eq("Purr")
      end
    end

    context ":sosumi" do
      it "returns 'Sosumi'" do
        expect(sound_name(:sosumi)).to eq("Sosumi")
      end
    end

    context ":submarine" do
      it "returns 'Submarine'" do
        expect(sound_name(:submarine)).to eq("Submarine")
      end
    end

    context ":tink" do
      it "returns 'Tink'" do
        expect(sound_name(:tink)).to eq("Tink")
      end
    end
  end
end
