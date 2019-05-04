package admin;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class AdminDAO {

	
	public String get_date2(int count){
		String result = getFormatDate("MM-dd","D",count);
		return result;
	
	}
	
	
	public String get_date(int count){
		String result = getFormatDate("yyyy-MM-dd","D",count);
		
		return result;
	}

	public static String getFormatDate(String format, String term_gubun,int term) {

		String ret_date = "";

		Calendar cur_date = Calendar.getInstance(); // 현재 날짜

		SimpleDateFormat formatter; // 날짜 포맷



		term_gubun = term_gubun.toUpperCase();

		if ("".equals(term_gubun))

			term_gubun = "NOW";



		try {

			if (term_gubun.equals("Y") || term_gubun.equals("M")

					|| term_gubun.equals("D") || term_gubun.equals("NOW")) {

				formatter = new SimpleDateFormat(format);



				if (term_gubun.equals("Y")) {

					cur_date.add(Calendar.YEAR, term);

				} else if (term_gubun.equals("M")) {

					cur_date.add(Calendar.MONTH, term);

				} else if (term_gubun.equals("D")) {

					cur_date.add(Calendar.DAY_OF_MONTH, term);

				}



				ret_date = formatter.format(cur_date.getTime());

			}

			return ret_date.trim();

		} catch (Exception e) {

			System.out.println("[MessageUtil::getDateFormt] Error = " + e);

		}

		return "";

	}

	
	
	
}
