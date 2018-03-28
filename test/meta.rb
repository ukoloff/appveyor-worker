class TestMeta < Minitest::Test
  Z = AppVeyor::Worker

  def test_class
    assert Z
    assert Module===Z
  end

  def test_skip
    assert Z.respond_to? :skipx?
  end

  def test_methods
    %i(message test env).each do |meth|
      assert Z.respond_to? meth
    end
  end


end
