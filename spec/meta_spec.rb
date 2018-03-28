RSpec.describe AppVeyor::Worker do
  it "is module" do
    expect(AppVeyor::Worker).to be_a(Module)
  end

  it "sometimes skips" do
    expect(AppVeyor::Worker.respond_to? :skipx?).to be true
  end

  it "provides methods" do
    %i(message test env).each do |meth|
      expect(AppVeyor::Worker.respond_to? meth).to be true
    end
  end
end
