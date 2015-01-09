require 'rails_helper'

describe Fly, :type => :model do
  
	let(:fly) { build(:fly) }

	subject { fly }

	it "responds to attributes" do
		is_expected.to respond_to(:name)
		is_expected.to respond_to(:position)
		is_expected.to respond_to(:website)
		is_expected.to respond_to(:equipment)
		is_expected.to respond_to(:base)
		is_expected.to respond_to(:intro)
		is_expected.to respond_to(:content)

		is_expected.to respond_to(:total_time)
		is_expected.to respond_to(:total_pic_time)
		is_expected.to respond_to(:multi_time)
		is_expected.to respond_to(:multi_pic_time)
		is_expected.to respond_to(:turbine_time)
		is_expected.to respond_to(:turbine_pic_time)
		is_expected.to respond_to(:turbofan_time)
		is_expected.to respond_to(:turbofan_pic_time)
		is_expected.to respond_to(:atpl)
		is_expected.to respond_to(:medical_license)
		is_expected.to respond_to(:work_right)
		is_expected.to respond_to(:valid_passport)
		is_expected.to respond_to(:background_check)
		is_expected.to respond_to(:drug_test)
		is_expected.to respond_to(:drivers_license)

		is_expected.to respond_to(:posting_date_as_string)
		is_expected.to respond_to(:posting_expiry_as_string)
		is_expected.to respond_to(:posting_date_as_date)
		is_expected.to respond_to(:posting_expiry_as_date)
		is_expected.to respond_to(:content_selector)
		is_expected.to respond_to(:no_track)
		is_expected.to respond_to(:no_match)
		is_expected.to respond_to(:airline)
		is_expected.to respond_to(:slug)
	end

	describe "responds to instance methods" do

		describe "#flight_time_requirements" do
			context "with some non-zero flight time requirements" do
				it "shows only non-zero requirements" do
					fly = create(:fly, flight_time: {"total_time" => "100", "total_pic_time" => "0", "multi_time" => "0", "multi_pic_time" => "10", 
	  	"turbine_time" => "10", "turbine_pic_time" => "0", "turbofan_time" => "0", "turbofan_pic_time" => "0"})
					expect(fly.flight_time_requirements).to eq({total_time: "100", multi_pic_time: "10", turbine_time: "10"})
				end
			end
		end
		
	end

	describe "responds to class methods and scopes" do
		
	end
end