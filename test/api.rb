class TestApi < Minitest::Test
  Z = AppVeyor::Worker

  def setup
    skip "Run on AppVeyor to test this" if Z.skip?
  end

  def test_msg
    Z.message "Hello, world!", Time.now.to_s
  end

  def test_env
    Z.env last_run: Time.now.to_s
  end

end
