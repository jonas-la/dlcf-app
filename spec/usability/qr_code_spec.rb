# # spec/usability/qr_code.rb

# require 'rails_helper'

RSpec.describe Event, type: :request do
    let(:qr) { RQRCode::QRCode.new(member_index_events_url, :level => :h)}
    # qr = RQRCode::QRCode.new(member_index_events_url, :level => :h)
    
    it "generates a QR code" do
        qr = RQRCode::QRCode.new(member_index_events_url, :level => :h)
        # if qr.valid?
        #     puts 'QRCode is valid.'
        # else
        #     puts 'QRCode generation encountered errors.'
        # end
    end

    it "generates a valid QR code" do
        # qr = RQRCode::QRCode.new(member_index_events_url, :level => :h)
        # qr = RQRCode::QRCode.new(member_index_events_url, :level => :h)
        # if qr.valid?
        #     puts 'QRCode is valid.'
        # else
        #     puts 'QRCode generation encountered errors.'
        # end

        # png = qr.to_img
        # # Save the QR code to a temporary file
        # file_path = Rails.root.join('tmp', 'qr_code.png')
        # png.resize(200, 200).save(file_path)
        # # Read the QR code from the image
        # decoded_qr = RQRCode::QRCode.new(ChunkyPNG::Image.from_file(file_path).to_s)
        # # Verify that the QR code contains the event URL
        # expect(decoded_qr.first.data).to eq(member_index_events_url())
    end

    it "renders the QR code on the page" do
        # TODO
    end
end

# RSpec.describe Event, type: :request do
#   it "generates a valid QR code" do

    # Generate the QR code
    # qr = RQRCode::QRCode.new(member_index_events_url, :level => :h)

#     # path = member_index_events_url # Access the path using the route helper
#     # puts "Value of member_index_events_url: #{path}"
#     png = qr.to_img

#     # Save the QR code to a temporary file
#     file_path = Rails.root.join('tmp', 'qr_code.png')
#     png.resize(200, 200).save(file_path)

#     # Read the QR code from the image
#     decoded_qr = RQRCode::QRCode.new(ChunkyPNG::Image.from_file(file_path).to_s)

#     # Verify that the QR code contains the event URL
#     expect(decoded_qr.first.data).to eq(member_index_events_url())
#   end
# end