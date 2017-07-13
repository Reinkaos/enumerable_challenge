# Returns a new array with the results of running block once for every element in enum.
# If no block is given, an enumerator is returned instead.
# It appears to be an alias for map
#
RSpec.describe '#collect' do
  let(:integers) { [1, 2, 3, 4] }

  it 'turns numbers into strings' do
    expect(integers).to all (be_an(Integer))

    strings = integers.collect { |i| i.to_s }

    expect(strings).to all (be_a(String))
  end

  it 'adds 1 to each integer' do
    incremented = integers.collect { |i| i + 1 }

    expect(incremented).to eq [2, 3, 4, 5]
  end

end
