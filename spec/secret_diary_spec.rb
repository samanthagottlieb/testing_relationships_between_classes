require_relative '../lib/secret_diary'

### WARNING ###
# For the purposes of this exercise, you are testing after
# the code has been written. This means your tests are prone
# to false positives!
#
# Make sure your tests work by deleting the bodies of the
# methods in `secret_diary.rb`, like this:
#
# ```ruby
# def write(new_message)
# end
# ```
#
# If they fail, then you know your tests are working
# as expected.
### WARNING ###

RSpec.describe SecretDiary do
  let(:diary) { double :diary }
  subject(:my_diary) { SecretDiary.new(diary) }

  context "when locked" do
    it "refuses to be read" do
      expect(my_diary.read).to eq("Go away!")
    end

    it "refuses to be written" do
      expect(my_diary.write("New diary entry")).to eq("Go away!")
    end
  end

  context "when unlocked" do
    it "gets read" do
      allow(diary).to receive(:read).and_return("Samantha's diary")
      my_diary.unlock
      
      expect(my_diary.read).to eq("Samantha's diary")
    end

    it "gets written" do
      allow(diary).to receive(:write)
      my_diary.unlock

      expect(my_diary.write("New diary entry")).to eq(nil)
    end
  end
end
