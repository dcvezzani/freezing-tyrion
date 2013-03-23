# This migration comes from bcms_my401k_library (originally 20130323183151)
class CreateArticles < ActiveRecord::Migration
  def self.up
    Cms::ContentType.create!(:name => "BcmsMy401kLibrary::Article", :group_name => "Article")

    Cms::Category.create!(:name => "BcmsMy401kLibrary::Article", :group_name => "Article")
    
    create_content_table :bcms_my401k_library_articles, :prefix=>false do |t|
      t.category :section
      t.category :layout
      t.text :title
      t.text :sub_title
      t.text :body
      t.text :summary
      t.text :tile_title
      t.text :tile_icon

      t.timestamps
    end
  end

  def self.down
    raise "down migrate this manually"
  end
end

cat_type = Cms::CategoryType.create!(name: "My401k Subject")
Cms::Category.create!(category_type: cat_type, parent_id: nil, name: "About Plan")
Cms::Category.create!(category_type: cat_type, parent_id: nil, name: "Manage Account")
Cms::Category.create!(category_type: cat_type, parent_id: nil, name: "Special Offers")
Cms::Category.create!(category_type: cat_type, parent_id: nil, name: "Helpful Resource")

cat_type = Cms::CategoryType.create!(name: "My401k Product Layout")
Cms::Category.create!(category_type: cat_type, parent_id: nil, name: "Layout 001")
Cms::Category.create!(category_type: cat_type, parent_id: nil, name: "Layout 002")
Cms::Category.create!(category_type: cat_type, parent_id: nil, name: "Layout 003")

