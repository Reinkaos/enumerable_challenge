# chunk { |elt| ... } -> an_enumerator click to toggle source
# Enumerates over the items, chunking them together
# based on the return value of the block.
# Consecutive elements which return the same block value are chunked together.

RSpec.describe 'chunk' do
  it 'pushes even consecutive numbers into the array' do
    evens = []
    [1, 2, 4, 5, 7, 8, 10].chunk(&:even?).each do |even, array|
      evens.push(array) if even
    end

    expect(evens.flatten).to eq [2, 4, 8, 10]
  end

  it 'removes nil elements from the array' do
    example = []
    [1, 2, 3, 4, 5].chunk { |i| i != 1 || nil }.each do |_, elements|
      example.concat(elements)
    end

    expect(example).to eq [2, 3, 4, 5]
  end
end
