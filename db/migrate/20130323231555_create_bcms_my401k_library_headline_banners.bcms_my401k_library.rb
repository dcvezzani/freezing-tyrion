# This migration comes from bcms_my401k_library (originally 20130323230606)
class CreateBcmsMy401kLibraryHeadlineBanners < ActiveRecord::Migration
  def change
    Cms::ContentType.create!(:name => "BcmsMy401kLibrary::HeadlineBanner", :group_name => "My401k Product")
    create_content_table :bcms_my401k_library_headline_banners, :prefix=>false do |t|
      t.belongs_to :section
      t.text :body
      t.text :banner_image

      t.timestamps
    end
  end

  def self.down
    raise "down migrate this manually"
  end
end
