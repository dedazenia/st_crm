package utils;

import javax.servlet.http.Cookie;

public class CookiesUtils {
    public static boolean isContainCookie(Cookie[] cookies, String cookieName) {
        if (cookies == null) {
            return false;
        }
        for (Cookie c : cookies) {
            if (c.getName().equals(cookieName)) {
                return true;
            }
        }
        return false;
    }

    public static Cookie getCookieByMane(String cookieName, Cookie[] cookies) {
        for (Cookie c : cookies) {
            if (c.getName().equals(cookieName)) {
                return c;
            }
        }
        return null; // никогда не будет, т/к ранее проверили ее наличие


    }
}


