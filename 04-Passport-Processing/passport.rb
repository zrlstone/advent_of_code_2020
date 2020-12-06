class Passport
  def initialize(attributes = {})
    @byr = attributes[:byr].to_i || 0
    @iyr = attributes[:iyr].to_i || 0
    @eyr = attributes[:eyr].to_i || 0
    @hgt = attributes[:hgt] || ''
    @hcl = attributes[:hcl] || ''
    @ecl = attributes[:ecl] || ''
    @pid = attributes[:pid] || ''
    @cid = attributes[:cid] || ''
  end

  def byr_check
    (1920..2002) === @byr
  end

  def iyr_check
    (2010..2020) === @iyr
  end

  def eyr_check
    (2020..2030) === @eyr
  end

  def hgt_check
    @hgt =~ /cm$/ && (150..193) === @hgt.to_i ||
      @hgt =~ /in$/ && (59..76) === @hgt.to_i
  end

  def hcl_check
    @hcl =~ /^#[0-9a-f]{6}$/
  end

  def ecl_check
    "amb blu brn gry grn hzl oth".include?(@ecl)
  end

  def pid_check
    @pid =~ /^\d{9}$/
  end
end
