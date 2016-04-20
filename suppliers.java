// ORM class for table 'suppliers'
// WARNING: This class is AUTO-GENERATED. Modify at your own risk.
//
// Debug information:
// Generated date: Tue Apr 19 08:23:38 PDT 2016
// For connector: org.apache.sqoop.manager.MySQLManager
import org.apache.hadoop.io.BytesWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.io.Writable;
import org.apache.hadoop.mapred.lib.db.DBWritable;
import com.cloudera.sqoop.lib.JdbcWritableBridge;
import com.cloudera.sqoop.lib.DelimiterSet;
import com.cloudera.sqoop.lib.FieldFormatter;
import com.cloudera.sqoop.lib.RecordParser;
import com.cloudera.sqoop.lib.BooleanParser;
import com.cloudera.sqoop.lib.BlobRef;
import com.cloudera.sqoop.lib.ClobRef;
import com.cloudera.sqoop.lib.LargeObjectLoader;
import com.cloudera.sqoop.lib.SqoopRecord;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public class suppliers extends SqoopRecord  implements DBWritable, Writable {
  private final int PROTOCOL_VERSION = 3;
  public int getClassFormatVersion() { return PROTOCOL_VERSION; }
  protected ResultSet __cur_result_set;
  private Integer supp_id;
  public Integer get_supp_id() {
    return supp_id;
  }
  public void set_supp_id(Integer supp_id) {
    this.supp_id = supp_id;
  }
  public suppliers with_supp_id(Integer supp_id) {
    this.supp_id = supp_id;
    return this;
  }
  private String company;
  public String get_company() {
    return company;
  }
  public void set_company(String company) {
    this.company = company;
  }
  public suppliers with_company(String company) {
    this.company = company;
    return this;
  }
  private String contact;
  public String get_contact() {
    return contact;
  }
  public void set_contact(String contact) {
    this.contact = contact;
  }
  public suppliers with_contact(String contact) {
    this.contact = contact;
    return this;
  }
  private String address;
  public String get_address() {
    return address;
  }
  public void set_address(String address) {
    this.address = address;
  }
  public suppliers with_address(String address) {
    this.address = address;
    return this;
  }
  private String city;
  public String get_city() {
    return city;
  }
  public void set_city(String city) {
    this.city = city;
  }
  public suppliers with_city(String city) {
    this.city = city;
    return this;
  }
  private String state;
  public String get_state() {
    return state;
  }
  public void set_state(String state) {
    this.state = state;
  }
  public suppliers with_state(String state) {
    this.state = state;
    return this;
  }
  private String zipcode;
  public String get_zipcode() {
    return zipcode;
  }
  public void set_zipcode(String zipcode) {
    this.zipcode = zipcode;
  }
  public suppliers with_zipcode(String zipcode) {
    this.zipcode = zipcode;
    return this;
  }
  private String phone;
  public String get_phone() {
    return phone;
  }
  public void set_phone(String phone) {
    this.phone = phone;
  }
  public suppliers with_phone(String phone) {
    this.phone = phone;
    return this;
  }
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof suppliers)) {
      return false;
    }
    suppliers that = (suppliers) o;
    boolean equal = true;
    equal = equal && (this.supp_id == null ? that.supp_id == null : this.supp_id.equals(that.supp_id));
    equal = equal && (this.company == null ? that.company == null : this.company.equals(that.company));
    equal = equal && (this.contact == null ? that.contact == null : this.contact.equals(that.contact));
    equal = equal && (this.address == null ? that.address == null : this.address.equals(that.address));
    equal = equal && (this.city == null ? that.city == null : this.city.equals(that.city));
    equal = equal && (this.state == null ? that.state == null : this.state.equals(that.state));
    equal = equal && (this.zipcode == null ? that.zipcode == null : this.zipcode.equals(that.zipcode));
    equal = equal && (this.phone == null ? that.phone == null : this.phone.equals(that.phone));
    return equal;
  }
  public boolean equals0(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof suppliers)) {
      return false;
    }
    suppliers that = (suppliers) o;
    boolean equal = true;
    equal = equal && (this.supp_id == null ? that.supp_id == null : this.supp_id.equals(that.supp_id));
    equal = equal && (this.company == null ? that.company == null : this.company.equals(that.company));
    equal = equal && (this.contact == null ? that.contact == null : this.contact.equals(that.contact));
    equal = equal && (this.address == null ? that.address == null : this.address.equals(that.address));
    equal = equal && (this.city == null ? that.city == null : this.city.equals(that.city));
    equal = equal && (this.state == null ? that.state == null : this.state.equals(that.state));
    equal = equal && (this.zipcode == null ? that.zipcode == null : this.zipcode.equals(that.zipcode));
    equal = equal && (this.phone == null ? that.phone == null : this.phone.equals(that.phone));
    return equal;
  }
  public void readFields(ResultSet __dbResults) throws SQLException {
    this.__cur_result_set = __dbResults;
    this.supp_id = JdbcWritableBridge.readInteger(1, __dbResults);
    this.company = JdbcWritableBridge.readString(2, __dbResults);
    this.contact = JdbcWritableBridge.readString(3, __dbResults);
    this.address = JdbcWritableBridge.readString(4, __dbResults);
    this.city = JdbcWritableBridge.readString(5, __dbResults);
    this.state = JdbcWritableBridge.readString(6, __dbResults);
    this.zipcode = JdbcWritableBridge.readString(7, __dbResults);
    this.phone = JdbcWritableBridge.readString(8, __dbResults);
  }
  public void readFields0(ResultSet __dbResults) throws SQLException {
    this.supp_id = JdbcWritableBridge.readInteger(1, __dbResults);
    this.company = JdbcWritableBridge.readString(2, __dbResults);
    this.contact = JdbcWritableBridge.readString(3, __dbResults);
    this.address = JdbcWritableBridge.readString(4, __dbResults);
    this.city = JdbcWritableBridge.readString(5, __dbResults);
    this.state = JdbcWritableBridge.readString(6, __dbResults);
    this.zipcode = JdbcWritableBridge.readString(7, __dbResults);
    this.phone = JdbcWritableBridge.readString(8, __dbResults);
  }
  public void loadLargeObjects(LargeObjectLoader __loader)
      throws SQLException, IOException, InterruptedException {
  }
  public void loadLargeObjects0(LargeObjectLoader __loader)
      throws SQLException, IOException, InterruptedException {
  }
  public void write(PreparedStatement __dbStmt) throws SQLException {
    write(__dbStmt, 0);
  }

  public int write(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeInteger(supp_id, 1 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeString(company, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(contact, 3 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(address, 4 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(city, 5 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(state, 6 + __off, 1, __dbStmt);
    JdbcWritableBridge.writeString(zipcode, 7 + __off, 1, __dbStmt);
    JdbcWritableBridge.writeString(phone, 8 + __off, 1, __dbStmt);
    return 8;
  }
  public void write0(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeInteger(supp_id, 1 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeString(company, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(contact, 3 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(address, 4 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(city, 5 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(state, 6 + __off, 1, __dbStmt);
    JdbcWritableBridge.writeString(zipcode, 7 + __off, 1, __dbStmt);
    JdbcWritableBridge.writeString(phone, 8 + __off, 1, __dbStmt);
  }
  public void readFields(DataInput __dataIn) throws IOException {
this.readFields0(__dataIn);  }
  public void readFields0(DataInput __dataIn) throws IOException {
    if (__dataIn.readBoolean()) { 
        this.supp_id = null;
    } else {
    this.supp_id = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.company = null;
    } else {
    this.company = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.contact = null;
    } else {
    this.contact = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.address = null;
    } else {
    this.address = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.city = null;
    } else {
    this.city = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.state = null;
    } else {
    this.state = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.zipcode = null;
    } else {
    this.zipcode = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.phone = null;
    } else {
    this.phone = Text.readString(__dataIn);
    }
  }
  public void write(DataOutput __dataOut) throws IOException {
    if (null == this.supp_id) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.supp_id);
    }
    if (null == this.company) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, company);
    }
    if (null == this.contact) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, contact);
    }
    if (null == this.address) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, address);
    }
    if (null == this.city) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, city);
    }
    if (null == this.state) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, state);
    }
    if (null == this.zipcode) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, zipcode);
    }
    if (null == this.phone) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, phone);
    }
  }
  public void write0(DataOutput __dataOut) throws IOException {
    if (null == this.supp_id) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.supp_id);
    }
    if (null == this.company) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, company);
    }
    if (null == this.contact) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, contact);
    }
    if (null == this.address) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, address);
    }
    if (null == this.city) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, city);
    }
    if (null == this.state) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, state);
    }
    if (null == this.zipcode) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, zipcode);
    }
    if (null == this.phone) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, phone);
    }
  }
  private static final DelimiterSet __outputDelimiters = new DelimiterSet((char) 9, (char) 10, (char) 0, (char) 0, false);
  public String toString() {
    return toString(__outputDelimiters, true);
  }
  public String toString(DelimiterSet delimiters) {
    return toString(delimiters, true);
  }
  public String toString(boolean useRecordDelim) {
    return toString(__outputDelimiters, useRecordDelim);
  }
  public String toString(DelimiterSet delimiters, boolean useRecordDelim) {
    StringBuilder __sb = new StringBuilder();
    char fieldDelim = delimiters.getFieldsTerminatedBy();
    __sb.append(FieldFormatter.escapeAndEnclose(supp_id==null?"null":"" + supp_id, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(company==null?"null":company, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(contact==null?"null":contact, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(address==null?"null":address, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(city==null?"null":city, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(state==null?"null":state, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(zipcode==null?"null":zipcode, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(phone==null?"null":phone, delimiters));
    if (useRecordDelim) {
      __sb.append(delimiters.getLinesTerminatedBy());
    }
    return __sb.toString();
  }
  public void toString0(DelimiterSet delimiters, StringBuilder __sb, char fieldDelim) {
    __sb.append(FieldFormatter.escapeAndEnclose(supp_id==null?"null":"" + supp_id, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(company==null?"null":company, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(contact==null?"null":contact, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(address==null?"null":address, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(city==null?"null":city, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(state==null?"null":state, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(zipcode==null?"null":zipcode, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(phone==null?"null":phone, delimiters));
  }
  private static final DelimiterSet __inputDelimiters = new DelimiterSet((char) 9, (char) 10, (char) 0, (char) 0, false);
  private RecordParser __parser;
  public void parse(Text __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(CharSequence __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(byte [] __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(char [] __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(ByteBuffer __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(CharBuffer __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  private void __loadFromFields(List<String> fields) {
    Iterator<String> __it = fields.listIterator();
    String __cur_str = null;
    try {
    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.supp_id = null; } else {
      this.supp_id = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.company = null; } else {
      this.company = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.contact = null; } else {
      this.contact = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.address = null; } else {
      this.address = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.city = null; } else {
      this.city = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.state = null; } else {
      this.state = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.zipcode = null; } else {
      this.zipcode = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.phone = null; } else {
      this.phone = __cur_str;
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  private void __loadFromFields0(Iterator<String> __it) {
    String __cur_str = null;
    try {
    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.supp_id = null; } else {
      this.supp_id = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.company = null; } else {
      this.company = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.contact = null; } else {
      this.contact = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.address = null; } else {
      this.address = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.city = null; } else {
      this.city = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.state = null; } else {
      this.state = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.zipcode = null; } else {
      this.zipcode = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.phone = null; } else {
      this.phone = __cur_str;
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  public Object clone() throws CloneNotSupportedException {
    suppliers o = (suppliers) super.clone();
    return o;
  }

  public void clone0(suppliers o) throws CloneNotSupportedException {
  }

  public Map<String, Object> getFieldMap() {
    Map<String, Object> __sqoop$field_map = new TreeMap<String, Object>();
    __sqoop$field_map.put("supp_id", this.supp_id);
    __sqoop$field_map.put("company", this.company);
    __sqoop$field_map.put("contact", this.contact);
    __sqoop$field_map.put("address", this.address);
    __sqoop$field_map.put("city", this.city);
    __sqoop$field_map.put("state", this.state);
    __sqoop$field_map.put("zipcode", this.zipcode);
    __sqoop$field_map.put("phone", this.phone);
    return __sqoop$field_map;
  }

  public void getFieldMap0(Map<String, Object> __sqoop$field_map) {
    __sqoop$field_map.put("supp_id", this.supp_id);
    __sqoop$field_map.put("company", this.company);
    __sqoop$field_map.put("contact", this.contact);
    __sqoop$field_map.put("address", this.address);
    __sqoop$field_map.put("city", this.city);
    __sqoop$field_map.put("state", this.state);
    __sqoop$field_map.put("zipcode", this.zipcode);
    __sqoop$field_map.put("phone", this.phone);
  }

  public void setField(String __fieldName, Object __fieldVal) {
    if ("supp_id".equals(__fieldName)) {
      this.supp_id = (Integer) __fieldVal;
    }
    else    if ("company".equals(__fieldName)) {
      this.company = (String) __fieldVal;
    }
    else    if ("contact".equals(__fieldName)) {
      this.contact = (String) __fieldVal;
    }
    else    if ("address".equals(__fieldName)) {
      this.address = (String) __fieldVal;
    }
    else    if ("city".equals(__fieldName)) {
      this.city = (String) __fieldVal;
    }
    else    if ("state".equals(__fieldName)) {
      this.state = (String) __fieldVal;
    }
    else    if ("zipcode".equals(__fieldName)) {
      this.zipcode = (String) __fieldVal;
    }
    else    if ("phone".equals(__fieldName)) {
      this.phone = (String) __fieldVal;
    }
    else {
      throw new RuntimeException("No such field: " + __fieldName);
    }
  }
  public boolean setField0(String __fieldName, Object __fieldVal) {
    if ("supp_id".equals(__fieldName)) {
      this.supp_id = (Integer) __fieldVal;
      return true;
    }
    else    if ("company".equals(__fieldName)) {
      this.company = (String) __fieldVal;
      return true;
    }
    else    if ("contact".equals(__fieldName)) {
      this.contact = (String) __fieldVal;
      return true;
    }
    else    if ("address".equals(__fieldName)) {
      this.address = (String) __fieldVal;
      return true;
    }
    else    if ("city".equals(__fieldName)) {
      this.city = (String) __fieldVal;
      return true;
    }
    else    if ("state".equals(__fieldName)) {
      this.state = (String) __fieldVal;
      return true;
    }
    else    if ("zipcode".equals(__fieldName)) {
      this.zipcode = (String) __fieldVal;
      return true;
    }
    else    if ("phone".equals(__fieldName)) {
      this.phone = (String) __fieldVal;
      return true;
    }
    else {
      return false;    }
  }
}
