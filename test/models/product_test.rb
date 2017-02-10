require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  fixtures :products

  test "product attributes must be not empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:image_url].any?
    assert product.errors[:price].any?
  end

  test "product price must be positive" do
    product = Product.new(:title => "price test title",
    :description => "tt",
    :image_url => "t.jpg")
    product.price = -1
    assert product.invalid?
    assert_equal "must be greater than or equal to 0.01", product.errors[:price].join(';')

    product.price=0
    assert product.invalid?
    assert_equal "must be greater than or equal to 0.01", product.errors[:price].join(';')

    product.price=1
    assert product.valid?
  end


  def new_product_with_image(image_url)
    Product.new(
               :title => "image test title",
               :description => "image test for description",
               :price => 1,
               :image_url => image_url
    )
  end

  test "image_url" do
    ok = %w{first.jpg ss.png ok.JPG xy.gif right.Jpg http://df.ddc.com/csdff/dsf.jpg}
    bad = %w{ wrong.exe wrong.jpg.com wrong.jpg/com }
    
    ok.each { |name| assert new_product_with_image(name).valid?, "#{name} shouldn't be invalid" }

    bad.each do |name|
      assert new_product_with_image(name).invalid?, "#{name} shouldn't be valid"
    end

  end

  test "unique title" do
    product = Product.new(
                         :title => products(:ruby).title,
                         :description => "abc",
                         :price => 3.44,
                         :image_url => 'image.png'
    )
    assert !product.save
    puts product.errors[:title].join(";")
    assert_equal "has already been taken", product.errors[:title].join(";")
  end


end
