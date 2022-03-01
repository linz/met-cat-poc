import o from 'ospec';
import Ajv from 'ajv';
import { dirname, join } from 'path';
import { fileURLToPath } from 'url';
import { promises as fs } from 'fs';
import { AjvOptions, DefaultTimeoutMillis } from '../../../validation.js';

const __dirname = dirname(fileURLToPath(import.meta.url));
const schemaPath = join(__dirname, '..', 'schema.json');
const examplePath = join(__dirname, '..', 'examples/item.json');

o.spec('Film item', () => {
  o.specTimeout(DefaultTimeoutMillis);
  let validate;
  const ajv = new Ajv(AjvOptions);

  o.before(async () => {
    const data = JSON.parse(await fs.readFile(schemaPath));
    validate = await ajv.compileAsync(data);
  });

  o('Example should pass validation', async () => {
    // given
    const example = JSON.parse(await fs.readFile(examplePath));

    // when
    let valid = validate(example);

    // then
    o(valid).equals(true)(JSON.stringify(validate.errors, null, 2));
  });

  o("Example with an incorrect 'film:id' field should fail validation", async () => {
    // given
    const example = JSON.parse(await fs.readFile(examplePath));
    example.properties['film:id'] = 1234;

    // when
    let valid = validate(example);

    // then
    o(valid).equals(false);
    o(
      validate.errors.some(
        (error) => error.instancePath === '/properties/film:id' && error.message === 'must be string',
      ),
    ).equals(true)(JSON.stringify(validate.errors));
  });

  o("Example without a mandatory 'film:id' field should fail validation", async () => {
    // given
    const example = JSON.parse(await fs.readFile(examplePath));
    delete example.properties['film:id'];

    // when
    let valid = validate(example);

    // then
    o(valid).equals(false);
    o(
      validate.errors.some(
        (error) => error.instancePath === '/properties' && error.message === "must have required property 'film:id'",
      ),
    ).equals(true)(JSON.stringify(validate.errors));
  });

  o("Example with an incorrect 'film:negative_sequence' field should fail validation", async () => {
    // given
    const example = JSON.parse(await fs.readFile(examplePath));
    example.properties['film:negative_sequence'] = 'incorrect_example';

    // when
    let valid = validate(example);

    // then
    o(valid).equals(false);
    o(
      validate.errors.some(
        (error) => error.instancePath === '/properties/film:negative_sequence' && error.message === 'must be integer',
      ),
    ).equals(true)(JSON.stringify(validate.errors));
  });

  o("Example without a mandatory 'film:negative_sequence' field should fail validation", async () => {
    // given
    const example = JSON.parse(await fs.readFile(examplePath));
    delete example.properties['film:negative_sequence'];

    // when
    let valid = validate(example);

    // then
    o(valid).equals(false);
    o(
      validate.errors.some(
        (error) =>
          error.instancePath === '/properties' &&
          error.message === "must have required property 'film:negative_sequence'",
      ),
    ).equals(true)(JSON.stringify(validate.errors));
  });
});
