import ReactOnRails from 'react-on-rails';

export const updateKindleEmail = (kindleEmail) => {
  const header = {
    headers: ReactOnRails.authenticityHeaders({
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    }),
    method: 'POST',
    body: JSON.stringify({ kindle_email: kindleEmail }),
    credentials: 'same-origin',
  };
  console.log(header);
  return fetch('/account_settings/update', header);
}