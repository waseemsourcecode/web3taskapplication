// ignore_for_file: constant_identifier_names, duplicate_ignore

// ignore: duplicate_ignore
enum ServerPorts {
  login,
  signup,
  countries,
  faqs,
  // ignore: constant_identifier_names
  user_profile,
  // ignore: constant_identifier_names
  latest_news,
  // ignore: constant_identifier_names
  filter_news,
  news, //news details
  leakage,
  malwares,
  // ignore: constant_identifier_names
  malware_detail, //for detail
  tools,
  // ignore: constant_identifier_names
  tool_detail, //for tool detail
  // ignore: constant_identifier_names
  forgot_email,
  // ignore: constant_identifier_names
  forgot_password_change,
  // ignore: constant_identifier_names
  update_profile,
  filters,
  icos,
  // ignore: constant_identifier_names
  iocs_detail,
  ttps,
  contacts,
  // ignore: constant_identifier_names
  ttps_detail,
  // ignore: constant_identifier_names
  add_to_bookmark, //?id=35$type=2 type 1 -> threat news type 2 -> general news
  search_leakage_data,
  get_gen_news,
  get_cve_engines,
  get_threat_news,
  get_threat_name,
  get_threat_actors,
  get_sensitive_leaked_info,
  get_sensitive_vulnerability_info,

  ///fix_vulnerability,
  fix_vulnerabilty,
  my_library,
  cve_search,
  //https://offset7.com/api/cve_search?query=low
  get_gnews_images,
  tactor_profile,
  check_credential_req, // 0 mean user never req 1 mean under review and 2 mean access
  accept_credentials,
  delete_account,
  notifications,
  activation_otp_send,
  get_leakage_credentials,
  get_vulnerability,
  get_lsensitive_leaked_info,
  remove_bookmark,
  get_notifications,
  get_most_affected_nations,
  sort_most_affected_nations,
  threat_news_filter,
  get_sector,
  get_comment,
  add_comment,
  like_rating,
  unlike_rating,
  check_like_news,
  finger_print_login,
  finger_print_add,
  guest_home_info,
  get_product,
  get_notification_alert
}
//