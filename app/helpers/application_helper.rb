module ApplicationHelper

    def get_alias(string)
        res = string.downcase
        res = res.gsub ' ', '-'
        res = res.gsub(/[':;,.]/, '')
        res = res.gsub 'À', 'a'
        res = res.gsub 'Á', 'a'
        res = res.gsub 'Â', 'a'
        res = res.gsub 'Ä', 'a'
        res = res.gsub 'à', 'a'
        res = res.gsub 'á', 'a'
        res = res.gsub 'â', 'a'
        res = res.gsub 'ä', 'a'
        res = res.gsub '@', 'a'
        res = res.gsub 'È', 'e'
        res = res.gsub 'É', 'e'
        res = res.gsub 'Ê', 'e'
        res = res.gsub 'Ë', 'e'
        res = res.gsub 'è', 'e'
        res = res.gsub 'é', 'e'
        res = res.gsub 'ê', 'e'
        res = res.gsub 'ë', 'e'
        res = res.gsub '€', 'e'
        res = res.gsub 'Ì', 'i'
        res = res.gsub 'Í', 'i'
        res = res.gsub 'Î', 'i'
        res = res.gsub 'Ï', 'i'
        res = res.gsub 'ì', 'i'
        res = res.gsub 'í', 'i'
        res = res.gsub 'î', 'i'
        res = res.gsub 'ï', 'i'
        res = res.gsub 'Ò', 'o'
        res = res.gsub 'Ó', 'o'
        res = res.gsub 'Ô', 'o'
        res = res.gsub 'Ö', 'o'
        res = res.gsub 'ò', 'o'
        res = res.gsub 'ó', 'o'
        res = res.gsub 'ô', 'o'
        res = res.gsub 'ö', 'o'
        res = res.gsub 'Ù', 'u'
        res = res.gsub 'Ú', 'u'
        res = res.gsub 'Û', 'u'
        res = res.gsub 'Ü', 'u'
        res = res.gsub 'ù', 'u'
        res = res.gsub 'ú', 'u'
        res = res.gsub 'û', 'u'
        res = res.gsub 'ü', 'u'
        res = res.gsub 'µ', 'u'
        res = res.gsub 'Œ', 'oe'
        res = res.gsub 'œ', 'oe'
        res = res.gsub '$', 's'
        res
    end

end
