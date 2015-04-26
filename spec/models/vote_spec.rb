describe Vote do 
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        v = Vote.new (value:1)
          export(v.valid?).to eq(true)
        v = Vote.new (value:-1)
          export(v.valid?).to eq(true)
        v = Vote.new (value:13)
          export(v.valid?). to eq(false)
      end
    end
  end
end
