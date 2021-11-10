/** Encapsulates a 2D vector. Allows chaining methods by returning a reference to itself
 * @author badlogicgames@gmail.com */
public class Vector2 {
  public float x;
  public float y;

  /** Constructs a new vector at (0,0) */
  public Vector2 () {
  }

  /** Constructs a vector with the given components
   * @param x The x-component
   * @param y The y-component */
  public Vector2 (float x, float y) {
    this.x = x;
    this.y = y;
  }

  /** Constructs a vector from the given vector
   * @param v The vector */
  public Vector2 (Vector2 v) {
    set(v);
  }

  public float len (float x, float y) {
    return (float)Math.sqrt(x * x + y * y);
  }

  
  public float len () {
    return (float)Math.sqrt(x * x + y * y);
  }

  public float len2 (float x, float y) {
    return x * x + y * y;
  }

  
  public float len2 () {
    return x * x + y * y;
  }

  
  public Vector2 set (Vector2 v) {
    x = v.x;
    y = v.y;
    return this;
  }

  /** Sets the components of this vector
   * @param x The x-component
   * @param y The y-component
   * @return This vector for chaining */
  public Vector2 set (float x, float y) {
    this.x = x;
    this.y = y;
    return this;
  }

  
  public Vector2 sub (Vector2 v) {
    x -= v.x;
    y -= v.y;
    return this;
  }

  /** Substracts the other vector from this vector.
   * @param x The x-component of the other vector
   * @param y The y-component of the other vector
   * @return This vector for chaining */
  public Vector2 sub (float x, float y) {
    this.x -= x;
    this.y -= y;
    return this;
  }

  
  public Vector2 nor () {
    float len = len();
    if (len != 0) {
      x /= len;
      y /= len;
    }
    return this;
  }

  
  public Vector2 add (Vector2 v) {
    x += v.x;
    y += v.y;
    return this;
  }

  /** Adds the given components to this vector
   * @param x The x-component
   * @param y The y-component
   * @return This vector for chaining */
  public Vector2 add (float x, float y) {
    this.x += x;
    this.y += y;
    return this;
  }

  public float dot (float x1, float y1, float x2, float y2) {
    return x1 * x2 + y1 * y2;
  }

  
  public float dot (Vector2 v) {
    return x * v.x + y * v.y;
  }

  public float dot (float ox, float oy) {
    return x * ox + y * oy;
  }

  
  public Vector2 scl (float scalar) {
    x *= scalar;
    y *= scalar;
    return this;
  }

  /** Multiplies this vector by a scalar
   * @return This vector for chaining */
  public Vector2 scl (float x, float y) {
    this.x *= x;
    this.y *= y;
    return this;
  }

  
  public Vector2 scl (Vector2 v) {
    this.x *= v.x;
    this.y *= v.y;
    return this;
  }

  
  public Vector2 mulAdd (Vector2 vec, float scalar) {
    this.x += vec.x * scalar;
    this.y += vec.y * scalar;
    return this;
  }

  
  public Vector2 mulAdd (Vector2 vec, Vector2 mulVec) {
    this.x += vec.x * mulVec.x;
    this.y += vec.y * mulVec.y;
    return this;
  }

  public float dst (float x1, float y1, float x2, float y2) {
    final float x_d = x2 - x1;
    final float y_d = y2 - y1;
    return (float)Math.sqrt(x_d * x_d + y_d * y_d);
  }

  
  public float dst (Vector2 v) {
    final float x_d = v.x - x;
    final float y_d = v.y - y;
    return (float)Math.sqrt(x_d * x_d + y_d * y_d);
  }

  /** @param x The x-component of the other vector
   * @param y The y-component of the other vector
   * @return the distance between this and the other vector */
  public float dst (float x, float y) {
    final float x_d = x - this.x;
    final float y_d = y - this.y;
    return (float)Math.sqrt(x_d * x_d + y_d * y_d);
  }

  public float dst2 (float x1, float y1, float x2, float y2) {
    final float x_d = x2 - x1;
    final float y_d = y2 - y1;
    return x_d * x_d + y_d * y_d;
  }

  
  public float dst2 (Vector2 v) {
    final float x_d = v.x - x;
    final float y_d = v.y - y;
    return x_d * x_d + y_d * y_d;
  }

  /** @param x The x-component of the other vector
   * @param y The y-component of the other vector
   * @return the squared distance between this and the other vector */
  public float dst2 (float x, float y) {
    final float x_d = x - this.x;
    final float y_d = y - this.y;
    return x_d * x_d + y_d * y_d;
  }

  
  public Vector2 setLength (float len) {
    return setLength2(len * len);
  }

  
  public Vector2 setLength2 (float len2) {
    float oldLen2 = len2();
    return (oldLen2 == 0 || oldLen2 == len2) ? this : scl((float)Math.sqrt(len2 / oldLen2));
  }
}
