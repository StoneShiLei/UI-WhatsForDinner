import { http } from "../api/http";
import url from "../api/url";

export async function checkUserAuth(): Promise<boolean> {
    let isAuthed = false;
    await http.get<boolean>(url.UserAuth, {}).then((res) => {
        isAuthed = res.statusCode == 200
    }).catch((err) => {
        isAuthed = false;
    })
    return isAuthed;
}