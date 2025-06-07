export function convertDate(dateString) {
    let date = new Date(dateString);
    return `${date.getFullYear()}.${date.getMonth() + 1}.${date.getDate()}`;
}

export function convertFullDate(dateString) {
    let date = new Date(dateString);
    let minute = String(date.getMinutes()).padStart(2, '0');
    return `${date.getFullYear()}.${date.getMonth() + 1}.${date.getDate()} ${date.getHours()}:${minute}`;
}