package share.conn.giftcon;

import java.util.UUID;

public class CommonsUtils {
	
	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}
