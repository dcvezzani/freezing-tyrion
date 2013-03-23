# This migration comes from bcms_my401k_library (originally 20130323203723)
class CreateBcmsMy401kLibraryArticleProducts < ActiveRecord::Migration
  def change
    Cms::ContentType.create!(:name => "BcmsMy401kLibrary::ArticleProduct", :group_name => "My401k Product")

    if(Cms::CategoryType.where{name == "My401k Subject"}.count < 1)
      cat_type = Cms::CategoryType.create!(name: "My401k Subject")
      Cms::Category.create!(category_type: cat_type, parent_id: nil, name: "About Plan")
      Cms::Category.create!(category_type: cat_type, parent_id: nil, name: "Manage Account")
      Cms::Category.create!(category_type: cat_type, parent_id: nil, name: "Special Offers")
      Cms::Category.create!(category_type: cat_type, parent_id: nil, name: "Helpful Resource")
    end

    if(Cms::CategoryType.where{name == "My401k Product Layout"}.count < 1)
      cat_type = Cms::CategoryType.create!(name: "My401k Product Layout")
      Cms::Category.create!(category_type: cat_type, parent_id: nil, name: "Layout 001")
      Cms::Category.create!(category_type: cat_type, parent_id: nil, name: "Layout 002")
      Cms::Category.create!(category_type: cat_type, parent_id: nil, name: "Layout 003")
    end

    create_content_table :bcms_my401k_library_article_products, :prefix=>false do |t|
      t.belongs_to :section
      t.belongs_to :layout
      t.text :title
      t.text :sub_title
      t.text :body, :size => (64.kilobytes + 1)
      t.text :summary, :size => (64.kilobytes + 1)
      t.text :tile_title
      t.text :tile_icon

      t.timestamps
    end
  end
end
