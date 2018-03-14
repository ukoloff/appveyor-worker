RSpec.describe AppVeyor::Worker do
  it "checks its state" do
    skip "Run on AppVeyor to test this" if AppVeyor::Worker.skip?
  end

  it "sends messages" do
    AppVeyor::Worker.message "Hello, world!", Time.now.to_s
  end

  it "sets environment" do
    AppVeyor::Worker.env last_run: Time.now.to_s
  end
end
