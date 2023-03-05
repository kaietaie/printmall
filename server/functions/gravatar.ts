import md5 from "md5";

export function gravatar (email: string) {
 return   'https://www.gravatar.com/avatar/' +md5(email.trim().toLowerCase())
}
