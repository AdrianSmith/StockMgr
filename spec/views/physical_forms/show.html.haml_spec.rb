require 'spec_helper'

describe "physical_forms/show.html.haml" do
  before(:each) do
    @physical_form = assign(:physical_form, stub_model(PhysicalForm,
      :name => "Name",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
