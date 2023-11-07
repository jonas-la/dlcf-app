require 'rails_helper'

RSpec.describe('admins/sessions/new.html.erb', type: :view) do
  it 'displays the expected content' do

    assign(:org_info,
           instance_double('org_info',
                           image: 'app/assets/images/dlcf_logo.jpg',
                           title: 'Title',
                           description: 'Description',
                           file: 'app/assets/pdfs/dlcf_charter.pdf'
                          )
          )
    assign(:officers, [])

    render

    expect(rendered).to(have_title('Deeper Life Campus Fellowship'))
    # expect(rendered).to have_selector('link[href="style.css"]')
    expect(rendered).to(have_selector('h1', text: 'Deeper Life Campus Fellowship'))
    # expect(rendered).to have_selector('img[src="image_url"][alt="TEST"]
    # [style="width: 200px; height: 200px; margin: 20px"]')
    expect(rendered).to(have_button('Sign In'))
    # expect(rendered).to have_link('Create Account', href: new_account_members_path)
    expect(rendered).to(have_selector('.info-title', text: 'Title'))
    expect(rendered).to(have_selector('.info-text', text: 'Description'))
    # expect(rendered).to have_link('View Charter', href: 'file_url', target: '_blank')
  end
end
