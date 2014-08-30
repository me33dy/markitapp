require 'spec_helper'
describe "static pages" do
	subject { page }

	describe "welcome page" do		
		before { visit root_path }
		it { should have_content('Welcome') }
		it { should have_title(fullTitle('')) }
		it { should_not have_title(fullTitle('| Welcome')) }
	end
	
end