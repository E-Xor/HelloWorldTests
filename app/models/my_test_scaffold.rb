class MyTestScaffold < ActiveRecord::Base
  # It will be aplied all queries of this model
  default_scope :order => 'title'
  # Reference for items in carts
  has_many :shop_items
  has_many :user_orders, :through => :shop_items

  # Images
  has_attached_file :image

  # Prevent delete is any item in a cart has reference
  before_destroy :no_shop_item

  validates :title, :description, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :title, :uniqueness => { :message => 'has already been taken. Should be unique.' }

  def no_shop_item
    return true if shop_items.count.zero?
    errors[:base] << "Shop Items present"
    return false
  end
end
