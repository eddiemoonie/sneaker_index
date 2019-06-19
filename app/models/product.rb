class Product < ApplicationRecord
  belongs_to :user

  has_attached_file :image, :styles => {
      :thumb    => ['100x100>',  :jpg, :quality => 70],
      :preview  => ['315x180>',  :jpg, :quality => 70],
      :large    => ['640x440>',  :jpg, :quality => 70],
      :retina   => ['1200x1200>',  :jpg, :quality => 30]
    }

  validates_attachment :image,
                     content_type: { content_type: /\Aimage\/.*\z/ },
                     size: { less_than: 1.megabyte }
end
