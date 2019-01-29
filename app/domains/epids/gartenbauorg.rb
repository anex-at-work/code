module Domains
  module Epids
    class Gartenbauorg < Abstract
      def output
        {
          description: @data[:comment],
          data: {
            project_deadline: project_deadline,
            size: size_of
          },
          epid: @data[:category],
          "trade_slug": "gartenbau",
          "order_type": "other",
          "address_attributes": {
            "line_1": "schoenerhauser alle 6-7",
            "postal_code": "10119",
            "city": "berlin"
          },
          "contact_attributes": {
            "gender": "male",
            "first_name": "John",
            "last_name": "Cruz",
            "email": "john@example.com",
            "fix_phone": "+49123213223",
            "mobile_phone": "03023131"
          },
          "cipid":"SLUG YOU HAVE GOT FROM DS TEAM"
        }
      end

      private
      def project_deadline
        details.present? ? details[:project_deadline] : ''
      end

      def size_of
        if details.present?
          return "#{details[:project_height]} m hight 13,00 m width"
        end
      end

      def details
        @data[:details]
      end
    end
  end
end
