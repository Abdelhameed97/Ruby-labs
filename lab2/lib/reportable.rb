module Reportable
    def formatted_report
        "Report for #{@name}:\nGPA: #{calculate_gpa.round(2)}"
    end
end
  