# This migration comes from bcms_my401k_library (originally 20130323211430)
class CreateBcmsMy401kLibraryBlogPosts < ActiveRecord::Migration
  def self.up
    Cms::ContentType.create!(:name => "BcmsMy401kLibrary::BlogPost", :group_name => "My401k Product")
  end

  def self.down
    raise "down migrate this manually"
  end
end
