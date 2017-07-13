# chunk_while {|elt_before, elt_after| bool } -> an_enumerator
# click to toggle source
# Creates an enumerator for each chunked elements. The beginnings of
# chunks are defined by the block.
# This method split each chunk using adjacent elements,
# elt_before and elt_after, in the receiver enumerator.
# This method split chunks between elt_before and elt_after where the block
# returns false.
# The block is called the length of the receiver enumerator minus one.
# The result enumerator yields the chunked elements as an array.
# So each method can be called as follows:
# enum.chunk_while { |elt_before, elt_after| bool }.each { |ary| ... }
# Other methods of the Enumerator class and Enumerable module, such as to_a, map
# etc., are also usable.

RSpec.describe 'chunk_while' do
  it 'returns an array of numbers where adding one results in the following number' do
    a = [1, 2, 3, 5, 6, 7, 9, 10].chunk_while { |i, j| i + 1 == j }
    expect(a.to_a).to eq [[1, 2, 3], [5, 6, 7], [9, 10]]
  end

  it 'returns arrays of consecutive even & odd numbers' do
    a = [7, 5, 9, 2, 0, 7, 9, 4, 2, 0]
    example = a.chunk_while { |i, j| i.even? == j.even? }.to_a
    expect(example).to eq [[7, 5, 9], [2, 0], [7, 9], [4, 2, 0]]
  end
end
