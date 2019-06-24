require 'rails_helper'

describe 'items api' do
  it 'sends a list of all items' do
    create_list(:item, 3)

    get '/api/v1/items'

    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items.count).to eq(3)
  end

  it 'can return a single item' do
    id = create(:item).id

    get "/api/v1/items/#{id}"

    expect(response).to be_successful

    item = JSON.parse(response.body)

    expect(item["id"]).to eq(id)
  end

  it 'can create a new item' do
    item_params = {name: 'green apple', description: 'A round green apple'}

    post "/api/v1/items/", params: {item: item_params}
    item = Item.last

    expect(response).to be_successful
    expect(item.name).to eq(item_params[:name])
  end

  it 'can update an existing record' do
    id = create(:item).id
    previous_name = Item.last.name
    item_params = {name: "Grape"}

    put "/api/v1/items/#{id}", params: {item: item_params}
    item = Item.find_by(id: id)

    expect(response).to be_successful
    expect(item.name).to_not eq(previous_name)
    expect(item.name).to eq(item_params[:name])
  end
end
