require "spec_helper"

describe Mongoid::Composable do

  describe ".prohibited_methods" do

    let(:methods) do
      described_class.prohibited_methods
    end

    Mongoid::Composable::MODULES.each do |mod|

      context "when checking in #{mod}" do

        mod.instance_methods.each do |method|

          it "includes #{method}" do
            expect(methods).to include(method.to_sym)
          end
        end
      end
    end
  end
end
