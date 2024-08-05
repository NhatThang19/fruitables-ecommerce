// package vn.knight.fruitables_ecommerce.domain;

// import java.time.Instant;
// import java.util.Set;

// import org.springframework.data.annotation.CreatedDate;
// import org.springframework.data.annotation.LastModifiedDate;

// import jakarta.persistence.Column;
// import jakarta.persistence.Entity;
// import jakarta.persistence.EnumType;
// import jakarta.persistence.Enumerated;
// import jakarta.persistence.GeneratedValue;
// import jakarta.persistence.GenerationType;
// import jakarta.persistence.Id;
// import jakarta.persistence.JoinColumn;
// import jakarta.persistence.JoinTable;
// import jakarta.persistence.ManyToMany;
// import jakarta.persistence.ManyToOne;
// import jakarta.persistence.OneToOne;
// import jakarta.persistence.Table;
// import jakarta.validation.constraints.NotNull;

// @Entity
// @Table(name = "product")
// public class Product {
// public enum Status {
// stoking, sold_out, stop_selling;
// }

// @Id
// @GeneratedValue(strategy = GenerationType.IDENTITY)
// private long id;

// @NotNull
// private String name;

// @NotNull
// private double price;

// @NotNull
// private long sold;

// @NotNull
// @Column(columnDefinition = "MEDIUMTEXT")
// private String detailDesc;

// @NotNull
// private String shortDesc;

// @CreatedDate
// private Instant createdDate;

// @LastModifiedDate
// private Instant lastModifiedDate;

// @NotNull
// @Enumerated(EnumType.STRING)
// private Status status;

// @OneToOne
// @JoinColumn(name = "avatar", referencedColumnName = "id")
// private Image image;

// @ManyToMany
// @JoinTable(name = "img_product", joinColumns = @JoinColumn(name =
// "product_id"), inverseJoinColumns = @JoinColumn(name = "image_id"))
// Set<Image> imageProduct;

// @ManyToOne
// @JoinColumn(name = "origin_id")
// private Origin origin;

// @ManyToOne
// @JoinColumn(name = "category_id")
// private Category category;

// public long getId() {
// return id;
// }

// public void setId(long id) {
// this.id = id;
// }

// public String getName() {
// return name;
// }

// public void setName(String name) {
// this.name = name;
// }

// public double getPrice() {
// return price;
// }

// public void setPrice(double price) {
// this.price = price;
// }

// public long getSold() {
// return sold;
// }

// public void setSold(long sold) {
// this.sold = sold;
// }

// public String getDetailDesc() {
// return detailDesc;
// }

// public void setDetailDesc(String detailDesc) {
// this.detailDesc = detailDesc;
// }

// public String getShortDesc() {
// return shortDesc;
// }

// public void setShortDesc(String shortDesc) {
// this.shortDesc = shortDesc;
// }

// public Instant getCreatedDate() {
// return createdDate;
// }

// public void setCreatedDate(Instant createdDate) {
// this.createdDate = createdDate;
// }

// public Instant getLastModifiedDate() {
// return lastModifiedDate;
// }

// public void setLastModifiedDate(Instant lastModifiedDate) {
// this.lastModifiedDate = lastModifiedDate;
// }

// public Status getStatus() {
// return status;
// }

// public void setStatus(Status status) {
// this.status = status;
// }

// public Image getImage() {
// return image;
// }

// public void setImage(Image image) {
// this.image = image;
// }

// public Set<Image> getImageProduct() {
// return imageProduct;
// }

// public void setImageProduct(Set<Image> imageProduct) {
// this.imageProduct = imageProduct;
// }

// public Origin getOrigin() {
// return origin;
// }

// public void setOrigin(Origin origin) {
// this.origin = origin;
// }

// public Category getCategory() {
// return category;
// }

// public void setCategory(Category category) {
// this.category = category;
// }
// }
