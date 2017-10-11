require 'array_methods'
require 'rspec'


describe Array do
  describe "#my_uniq" do

    subject(:arr) { Array.new([1, 2, 1, 3, 3]) }

    it "doesn't modify the original array" do
      previous_arr = arr.dup
      arr.my_uniq
      expect(previous_arr).to eq(arr)
    end

    it "returns in the order in which they appear" do
      expect(arr.my_uniq).to eq([1,2,3])
    end

    it "return unique values" do
      uniq_arr = arr.my_uniq
      uniq_arr.each do |e|
        expect(uniq_arr.count(e)).to eq(1)
      end
    end
  end


  describe "#two-sum" do

    subject(:arr) { Array.new([-1, 0, 2, -2, 1]) }

    it "returns correct number of pairs" do
      expect(arr.two_sum.length).to eq(2)
    end

    it "each pair adds to zero" do
      arr.two_sum.each do |pair|
        expect(arr[pair[0]] + arr[pair[1]]).to eq(0)
      end
    end

    it "pairs are in the correct order" do
      sums = arr.two_sum
      sorted_sums = sums.sort { |a, b| a[1] <=> b[1] }
                        .sort { |a, b| a[0] <=> b[0] }

      expect(sorted_sums).to eq(sums)

    end
  end


end

describe "#my_transpose" do

  subject (:arr) do
    Array.new([
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
    ])
  end

  it "contains same size as the original" do
    expect(my_transpose(arr).flatten.length).to eq(arr.flatten.length)
  end


  it "contains the same elements as the original" do
    my_transpose(arr).flatten do |el|
      expect(arr.flatten).to include(el)
    end
  end

  it "each column will become the row" do
    arr_transposed = my_transpose(arr)
    arr.length.times do |i|
      arr.length.times do |j|
        expect(arr[i][j]).to eq(arr_transposed[j][i])
      end
    end
  end
end

describe "#stock_picker" do
  subject(:stock_prices) { Array.new([100, 60, 2, 1, 6, 7, 9, 3, 2, 15, 2, 5, 18, 28, 1]) }
  let(:stock) { stock_picker(stock_prices) }

  it "doesn't sell before buy" do
    expect(stock[0] < stock[1]).to be(true)
  end

  it "returns buy and sell" do
    expect(stock.length).to eq(2)
  end

  it 'returns the most profitable pair' do
    expect(stock).to eq([3, 13])
  end

end
