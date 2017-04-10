class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.jsonb :options, default: {}

      t.timestamps null: false
    end
  end
end
where('options @> ? OR options @> ?', {site_id: @identifier}.to_json,
      {requester_site_id: @identifier}.to_json)

where('options @> ?', {"twitter": "john30000"}.to_json)