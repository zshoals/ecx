package ecx;

import ecx.components.Value;
import utest.Assert;

class ComponentTest extends EcxTest {

	public function new() {
		super();
	}

	public function setup() {
		world.invalidate();
	}

	public function testComponentCreate() {
		var e = world.create();
		var value:Value = world.resolve(Value);

		var v:ValueData = value.create(e);
		Assert.notNull(v);
//		Assert.equals(e.id, v.entity.id);
//		Assert.equals(world, v.world);

		v.value = 10;
		Assert.equals(10, v.value);

		world.delete(e);

		world.invalidate();

//		Assert.isNull(v.world);
//		Assert.isTrue(v.entity.isInvalid);
	}

	public function testComponentDelete() {
		var e = world.create();
		var value:Value = world.resolve(Value);
		var v:ValueData = value.create(e);
		Assert.notNull(v);

		value.remove(e);

//		Assert.isFalse(v.entity.isValid);
//		Assert.isNull(v.world);

		var noValue:ValueData = value.get(e);
		Assert.isNull(noValue);

		world.delete(e);
	}
}