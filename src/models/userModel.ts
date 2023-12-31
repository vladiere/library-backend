export default interface ILibrarian {
  librarian_id: number;
  firstname: string;
  middlename: string;
  lastname: string;
  email_address: string;
  phone_number: string;
  hobbies: string;
  description: string;
  street_address: string;
  city: string;
  state_province_region: string;
  postal_code: number;
  address_type: string;
  username: string;
  password: string;
  privilege: string;
}

export default interface IUser {
  email: string;
  password: string;
  fullname: string;
  department: string;
  id_number: number;
  role: string;
}
